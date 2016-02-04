from selenium import webdriver
import unittest

from selenium.webdriver.common.keys import Keys

class PostsIndexTest(unittest.TestCase):
    def setUp(self):
        self.browser = webdriver.Firefox()
        self.browser.explicitly_wait(3)


    def tearDown(self):
        self.browser.quit()

    def test_can_view_index(self):
        self.browser.get('http://localhost:8000')

 # arrives at the page and sees img elements

 # the page has an element refering to 'save the right whales'

 # there is a sign in button

 # when clicked on it leads to a sign in form

 # takes a username and a password

 # when filled and submitted it redirects to the same page
 # and and signed in as *username* is in the header.

 # there is a div class new-post that when clicked leads to a
 # form

 # it has input class post-front-input and post-back-input
 # when filled and submitted with "Build the internet" and
 # "quickly"

 # a new post appears with post-front == "Build the Internet"
 # and post-back == 'quickly'
