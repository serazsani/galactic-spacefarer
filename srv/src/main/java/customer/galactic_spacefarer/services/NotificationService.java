package customer.galactic_spacefarer.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import cds.gen.galacticservice.Spacefarers;

@Service
public class NotificationService {

    private static final Logger LOG =
        LoggerFactory.getLogger(NotificationService.class);

    public void sendWelcomeEmail(Spacefarers spacefarer) {

        LOG.info(
            "Mock email sent to {}: Welcome {} {}! Your Galactic Spacefarer adventure has begun.",
            spacefarer.getEmail(),
            spacefarer.getFirstName(),
            spacefarer.getLastName()
        );
    }
}