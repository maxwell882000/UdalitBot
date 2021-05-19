from werkzeug.utils import secure_filename
from config import Config
from application.admin import bp
from flask_login import login_required
from flask import render_template, redirect, url_for, flash, request
from .forms import MailForm
from application import telegram_bot
import telebot
from application.core.models import User
import os
from threading import Thread
from time import sleep

def do_mailing(image, text, preview):
    file_id = None
    users = User.query.all()
    admin_ids = [583411442, 295612129]
    if preview == False:
        if image:
            for user in users:
                user_id = user.id
                if file_id:
                    try:
                        telegram_bot.send_photo(chat_id=user_id,
                                                photo=file_id,
                                                caption=text)
                    except telebot.apihelper.ApiException:
                        continue
                else:
                    try:
                        file = open(image, 'rb')
                        file_id = telegram_bot.send_photo(chat_id=user_id,
                                                            photo=file,
                                                            caption=text).photo[-1].file_id
                        file.close()
                    except telebot.apihelper.ApiException:
                        continue
                sleep(1 / 10) # 10 message per second
        else:
            for user in users:
                user_id = user.id
                try:
                    telegram_bot.send_message(chat_id=user_id,
                                                text=text)
                except telebot.apihelper.ApiException:
                    continue
                sleep(1 / 10) # 10 message per second
    elif preview == True:
        if image:
            for user in admin_ids:
                user_id = user
                if file_id:
                    try:
                        telegram_bot.send_photo(chat_id=user_id,
                                                photo=file_id,
                                                caption=text)
                    except telebot.apihelper.ApiException:
                        continue
                else:
                    try:
                        file = open(image, 'rb')
                        file_id = telegram_bot.send_photo(chat_id=user_id,
                                                            photo=file,
                                                            caption=text).photo[-1].file_id
                        file.close()
                    except telebot.apihelper.ApiException:
                        continue
        else:
            for user in admin_ids:
                user_id = user
                try:
                    telegram_bot.send_message(chat_id=user_id,
                                                text=text)
                except telebot.apihelper.ApiException:
                    continue
                

            

@bp.route('/mailing', methods=['GET', 'POST'])
@login_required
def mailing():
    mail_form = MailForm()
    if request.method == 'POST':
        file = request.files['image']
        filepath = None
        if file:
            filename = secure_filename(file.filename)
            file.save(os.path.join(Config.MAILING_DIRECTORY, filename))
            filepath = (Config.MAILING_DIRECTORY + filename)
        text = mail_form.mail.data
        thread = Thread(target = do_mailing, args = (filepath, text, mail_form.preview.data))
        thread.start()
        flash('Рассылка запущена!', category='success')
        return redirect(url_for('admin.mailing'))
    return render_template('admin/mailing.html',
                           title='Настройки',
                           area='mailing',
                           mail_form=mail_form)
