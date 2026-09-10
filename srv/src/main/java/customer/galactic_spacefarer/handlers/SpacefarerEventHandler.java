package customer.galactic_spacefarer.handlers;

import org.springframework.stereotype.Component;

import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CqnService;

import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.galacticservice.GalacticService_;
import cds.gen.galacticservice.Spacefarers;
import cds.gen.galacticservice.Spacefarers_;

import customer.galactic_spacefarer.services.NotificationService;

@Component
@ServiceName(GalacticService_.CDS_NAME)
public class SpacefarerEventHandler implements EventHandler {

    private static final int MAX_NAVIGATION_SKILL = 100;
    private static final double SKILL_ENHANCEMENT_RATE = 0.1;
    private static final long STARDUST_PER_SKILL_POINT = 100;

    private final NotificationService notificationService;

    public SpacefarerEventHandler(NotificationService notificationService) {
        this.notificationService = notificationService;
    }

    @Before(event = CqnService.EVENT_CREATE, entity = Spacefarers_.CDS_NAME)
    public void beforeCreate(CdsCreateEventContext context, Spacefarers spacefarer) {

        Integer navigationSkill = spacefarer.getWormholeNavigationSkill();
        Long stardustCollection = spacefarer.getStardustCollection();

        // Treat missing values as zero.
        if (navigationSkill == null) {
            navigationSkill = 0;
        }

        if (stardustCollection == null) {
            stardustCollection = 0L;
        }

        // Improve navigation skill by 10% of the remaining distance to 100, rounded upward.
        int skillEnhancement = (int) Math.ceil(
            (MAX_NAVIGATION_SKILL - navigationSkill) * SKILL_ENHANCEMENT_RATE
        );

        int enhancedSkill = navigationSkill + skillEnhancement;

        // Award stardust based on the enhanced navigation skill.
        long stardustReward = enhancedSkill * STARDUST_PER_SKILL_POINT;
        long enhancedStardustCollection = stardustCollection + stardustReward;

        spacefarer.setWormholeNavigationSkill(enhancedSkill);
        spacefarer.setStardustCollection(enhancedStardustCollection);
    }

    @After(event = CqnService.EVENT_CREATE, entity = Spacefarers_.CDS_NAME)
    public void afterCreate(Spacefarers spacefarer) {
        notificationService.sendWelcomeEmail(spacefarer);
    }

}