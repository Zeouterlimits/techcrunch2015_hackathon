package ht

class TwilioController {
/*

this is example how to use Twilio from the COntroller:

  */

    //- include
    def twilioService
    def hummService


    def index() {

        def msg = [
                body: "blah ${new Date()}"
        ]
        //call
        render "sent " + twilioService.sendMsg(msg)
    }

    def humm() {

        //call
        render "sent " + hummService.getArtistList("beck")
    }
}
