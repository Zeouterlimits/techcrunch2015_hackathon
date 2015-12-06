package techcrunchaol


class QueryParamInterceptor {

    QueryParamInterceptor() {
        matchAll()
    }

    boolean before() {
        println(params)
        println(session)
        if (params.artistId) {
            session.Artist = true
            session.Venue = false
        }
        if (params.venueId) {
            session.Venue = true
            session.Artist = false
        }
        if (params.reset) {
            session.Venue = false
            session.Artist = false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
