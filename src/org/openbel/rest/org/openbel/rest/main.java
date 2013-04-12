/**
 * Copyright (C) 2013 Selventa, Inc.
 *
 * This file is part of the BEL Framework REST API.
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * The BEL Framework REST API is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser
 * General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with the BEL Framework REST API. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Additional Terms under LGPL v3:
 *
 * This license does not authorize you and you are prohibited from using the
 * name, trademarks, service marks, logos or similar indicia of Selventa, Inc.,
 * or, in the discretion of other licensors or authors of the program, the
 * name, trademarks, service marks, logos or similar indicia of such authors or
 * licensors, in any marketing or advertising materials relating to your
 * distribution of the program or any covered product. This restriction does
 * not waive or limit your obligation to keep intact all copyright notices set
 * forth in the program as delivered to you.
 *
 * If you distribute the program in whole or in part, or any modified version
 * of the program, and you assume contractual liability to the recipient with
 * respect to the program or modified version, then you will indemnify the
 * authors and licensors of the program for any liabilities that these
 * contractual assumptions directly impose on those licensors and authors.
 */
package org.openbel.rest;

import org.openbel.rest.common.RootResource;
import org.restlet.Component;
import org.restlet.Context;
import org.restlet.Server;

import static java.lang.System.*;
import static java.lang.Runtime.*;
import static java.lang.Thread.sleep;
import static org.restlet.data.Protocol.HTTP;
import static java.lang.Integer.parseInt;

class main extends Component {
    static int port;
    static APIApplication apiapp;

    public main() {
        getServers().add(HTTP, port);
        getDefaultHost().attachDefault(apiapp);
    }

    public static void main(String... args) {
        String value = getenv("_ENV_PORT");
        if (value == null) {
            err.println("no _ENV_PORT is set");
            exit(1);
        }
        port = parseInt(value);
        out.println("PORT is " + port);
        apiapp = new APIApplication();
        main main = new main();
        try {
            main.start();
        } catch (Exception e) {
            err.println(e);
            e.printStackTrace();
        }
    }

}

