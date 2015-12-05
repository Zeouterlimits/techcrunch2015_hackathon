package com.aol.dublin.techcrunch.web.rest.util;

import org.springframework.http.HttpHeaders;

/**
 * Utility class for http header creation.
 *
 */
public class HeaderUtil {

    public static HttpHeaders createAlert(String message, String param) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-aolDubTechCrunch2015App-alert", message);
        headers.add("X-aolDubTechCrunch2015App-params", param);
        return headers;
    }

    public static HttpHeaders createEntityCreationAlert(String entityName, String param) {
        return createAlert("aolDubTechCrunch2015App." + entityName + ".created", param);
    }

    public static HttpHeaders createEntityUpdateAlert(String entityName, String param) {
        return createAlert("aolDubTechCrunch2015App." + entityName + ".updated", param);
    }

    public static HttpHeaders createEntityDeletionAlert(String entityName, String param) {
        return createAlert("aolDubTechCrunch2015App." + entityName + ".deleted", param);
    }

    public static HttpHeaders createFailureAlert(String entityName, String errorKey, String defaultMessage) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("X-aolDubTechCrunch2015App-error", "error." + errorKey);
        headers.add("X-aolDubTechCrunch2015App-params", entityName);
        return headers;
    }
}
