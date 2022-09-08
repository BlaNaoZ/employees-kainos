package org.example;

import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;
import io.federecio.dropwizard.swagger.SwaggerBundle;
import io.federecio.dropwizard.swagger.SwaggerBundleConfiguration;
import org.example.resources.WebService;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class EmployeesKainosApplication extends Application<EmployeesKainosConfiguration> {

    public static void main(final String[] args) throws Exception {
        new EmployeesKainosApplication().run(args);
    }

    @Override
    public String getName() {
        return "EmployeesKainos";
    }

    @Override
    public void initialize(final Bootstrap<EmployeesKainosConfiguration> bootstrap) {
        bootstrap.addBundle(new SwaggerBundle<EmployeesKainosConfiguration>() {
            @Override
            protected SwaggerBundleConfiguration getSwaggerBundleConfiguration(EmployeesKainosConfiguration configuration) {
                return configuration.getSwagger();
            }
        });
    }

    @Override
    public void run(final EmployeesKainosConfiguration configuration,
                    final Environment environment) {
        environment.jersey().register(new WebService());
    }

}
