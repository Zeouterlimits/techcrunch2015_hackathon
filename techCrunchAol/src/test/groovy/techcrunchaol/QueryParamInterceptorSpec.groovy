package techcrunchaol


import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(QueryParamInterceptor)
class QueryParamInterceptorSpec extends Specification {

    def setup() {
    }

    def cleanup() {

    }

    void "Test queryParam interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"queryParam")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
