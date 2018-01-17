#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import json
import random

from slackclient import SlackClient

SLACK_TOKEN = os.environ['SLACK_TOKEN']
SLACK_CHANNEL = 'random'

class RotationMember(object):
    def __init__(self, slack_username):
        self.slack_username = slack_username

openings = ['It\'s your lucky day.',
            'Thanks for doing this.',
            'It\'s simple.',
            'All hands on deck.']

closings = ['Go sort the kitchen out please.',
            'From all of us at Airtame, thank you for your kitchen service.',
            'You\'re supposed to clean the kitchen today.',
            'Get to kitchen work.']

remote_users = ['allisoneyres', 'esteban', 'jordan', 'luca', 'larsjensen', 'eli', 'brenner', 'daniel.schiffer', 'raz', 'paolo', 'michal', 'stephen.hughes', 'claudia', 'kaspermandix', 'marius', 'nikita', 'zoom', 'slackbot']

class KitchenBot(object):
    def __init__(self):
        self._slack_client = SlackClient(SLACK_TOKEN)

    def _get_current_kitchen_pair(self):
        return random.sample(self._get_slack_user_list(), 4)

    def _get_slack_channel_id(self):
        channels = json.loads(self._slack_client.api_call("channels.list"))['channels']
        return filter(lambda channel: channel['name'] == SLACK_CHANNEL, channels)[0]['id']

    def _get_slack_user_id(self, username):
        users = json.loads(self._slack_client.api_call("users.list"))['members']
        return filter(lambda user: user['name'] == username, users)[0]['id']

    def _get_slack_user_list(self):
        users = json.loads(self._slack_client.api_call("users.list"))['members']
        active_users = []

        # Find a list of currently active Slack usernames.
        # There is probably a better way to do this.
        for user in users:
            if((user['deleted'] is True) or \
               (user['is_bot'] is True) or \
               (user['is_restricted'] is True) or \
               (user['is_ultra_restricted'] is True)) or \
               (user['name'] in remote_users):
                next
            else:
                active_users.append(user['name'])

        return active_users

    def _tag_slack_user(self, slack_username):
        slack_id = self._get_slack_user_id(slack_username)
        return "<@{}|{}>".format(slack_id, slack_username)

    def post_slack_new_pair(self):
        pair = self._get_current_kitchen_pair()
        opening = random.choice(openings)
        closing = random.choice(closings)
        new_rotation_msg = "{} {}, {}, {} and {}. {}".format(opening,
                                                    self._tag_slack_user(pair[0]),
                                                    self._tag_slack_user(pair[1]),
                                                    self._tag_slack_user(pair[2]),
                                                    self._tag_slack_user(pair[3]),
                                                    closing)
        self._slack_client.api_call("chat.postMessage", channel=self._get_slack_channel_id(), text=new_rotation_msg, as_user=True)

def main():
    kitchen_bot = KitchenBot()
    kitchen_bot.post_slack_new_pair()

main()
