package techcrunchaol

import com.mashape.unirest.http.HttpResponse
import com.mashape.unirest.http.JsonNode
import com.mashape.unirest.http.Unirest
import grails.transaction.Transactional
import org.json.JSONObject

@Transactional
class HummService {

    public static final String MASHAPE_KEY = "j4ZRxf1LXHmsh6tGYthaIvPqZ9TJp1LKKiRjsnyW06N9upiFn0"
    public static final String AUTH_TOKEN = "566348a1ae8c506d4a8b4569"

    def getArtistList(artist){
        println artist
        HttpResponse<JsonNode> response = Unirest.get("https://humm-api.p.mashape.com/artists?auth=" +
                AUTH_TOKEN + "&keyword=" + URLEncoder.encode(artist, "UTF-8") + "&limit=5&offset=0")
                .header("X-Mashape-Key", MASHAPE_KEY)
                .header("Accept", "application/json")
                .asJson()
        JSONObject jsonNode = response.body.getObject()
        return jsonNode.get("data_response")
    }

}
