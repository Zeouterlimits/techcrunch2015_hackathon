package techcrunchaol

import com.twilio.sdk.TwilioRestClient
import com.twilio.sdk.resource.factory.MessageFactory
import com.twilio.sdk.resource.instance.Message
import grails.transaction.Transactional
import org.apache.http.NameValuePair
import org.apache.http.message.BasicNameValuePair

@Transactional
class TwilioService {

    public static final String ACCOUNT_SID = "AC08bf195b9d715dfa043c1e923f5d8431"
    public static final String AUTH_TOKEN = "2ff90b799da5b7cf576727820606a337"

    def sendMsg(msg) {

        TwilioRestClient client = new TwilioRestClient(ACCOUNT_SID, AUTH_TOKEN);

        // Build the parameters
        List<NameValuePair> params = new ArrayList<NameValuePair>()
        params.add(new BasicNameValuePair("To", msg.to ?: "+353851146849"))
        params.add(new BasicNameValuePair("From", "+18704554152"))
        params.add(new BasicNameValuePair("Body", msg.body ?: "default body"))

        println 'sending...'
        params.each { println it }

        MessageFactory messageFactory = client.getAccount().getMessageFactory()
        Message message = messageFactory.create(params)
        message.getSid()

    }
}
