FROM python:2.7.11-alpine

# Default environment variable settings
ENV SLACK_TOKEN default

# Add files to container
ADD requirements.txt /root/
ADD kitchen-bot.py /root/

# Set up permissions
RUN chmod a+x /root/kitchen-bot.py

# Install dependencies
RUN pip install -r /root/requirements.txt

# Set up SSL certs for Slack
RUN apk --no-cache add ca-certificates

# Cronjob to run
RUN echo "0 7 * * MON-FRI python /root/kitchen-bot.py >> /var/log/kitchen-bot.log 2>&1" >> /etc/crontabs/root

# Start cron daemon and log output
CMD touch /var/log/kitchen-bot.log && crond && tail -f /var/log/kitchen-bot.log
