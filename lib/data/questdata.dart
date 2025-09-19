import "package:farmify_app/model/objective.dart";
import "package:farmify_app/model/questmodel.dart";

final List<Quest> quests = [
  // 🌱 Soil Health & Fertility
  Quest(
    id: "soil_testing_quest",
    name: "Soil Testing Quest",
    description:
        "Learn about your farm's soil health by testing and analyzing it for better crop productivity.",
    objectives: [
      Objective(description: "Collect a soil sample", isCompleted: true),
      Objective(description: "Send it to a local lab", isCompleted: true),
      Objective(description: "Upload results in the app", isCompleted: false),
    ],
    photo: "assets/images/soiltest.png",
    badge: "Soil Health Badge",
    rewardPoints: 300,
    eligibility: "Available to all farmers with active crops",
    redeemInstructions: "Points can be redeemed for discounts on soil kits.",
  ),
  Quest(
    id: "organic_fertilizer_use",
    name: "Organic Fertilizer Use",
    description:
        "Encourage eco-friendly farming by preparing and using organic fertilizers for healthy soil.",
    objectives: [
      Objective(
        description: "Prepare compost or bio-fertilizer",
        isCompleted: true,
      ),
      Objective(description: "Apply to one crop cycle", isCompleted: true),
      Objective(description: "Upload before/after photos", isCompleted: true),
    ],
    photo: "assets/images/organicfertiliser.png",
    badge: "Fertility Builder Badge",
    rewardPoints: 400,
    eligibility: "Farm size above 0.5 acre",
    redeemInstructions: "Use points at partner agri-input shops.",
  ),
  Quest(
    id: "soil_cover_quest",
    name: "Soil Cover Quest",
    description:
        "Protect your soil from erosion and improve fertility by using cover crops and mulching.",
    objectives: [
      Objective(
        description: "Plant cover crops (e.g., legumes)",
        isCompleted: false,
      ),
      Objective(
        description: "Apply mulch to reduce soil erosion",
        isCompleted: true,
      ),
    ],
    photo: "assets/images/soilcover.jpg",
    badge: "Soil Protector Badge",
    rewardPoints: 350,
    eligibility: "Cereal crop farmers preferred",
    redeemInstructions: "Redeem points for seed vouchers.",
  ),
  // 💧 Water & Irrigation
  Quest(
    id: "water_conservation_challenge",
    name: "Water Conservation Challenge",
    description:
        "Save water and reduce irrigation costs by implementing efficient water management techniques.",
    objectives: [
      Objective(
        description: "Implement drip or sprinkler irrigation",
        isCompleted: true,
      ),
      Objective(
        description: "Record water usage before & after",
        isCompleted: true,
      ),
    ],
    photo: "assets/images/waterconservation.jpg",
    badge: "Water Saver Badge",
    rewardPoints: 500,
    eligibility: "Farmers with irrigated land",
    redeemInstructions:
        "Points can reduce electricity bill through scheme tie-ups.",
  ),
  Quest(
    id: "rainwater_harvesting",
    name: "Rainwater Harvesting",
    description:
        "Collect and store rainwater for sustainable irrigation and reduce dependence on groundwater.",
    objectives: [
      Objective(
        description: "Set up rainwater harvesting structure",
        isCompleted: true,
      ),
      Objective(
        description: "Show stored water used for irrigation",
        isCompleted: false,
      ),
    ],
    photo: "assets/images/rainwater.jpg",
    badge: "Water Guardian Badge",
    rewardPoints: 450,
    eligibility: "Farmers with roof or open field collection area",
    redeemInstructions: "Redeem points for farm pond subsidy applications.",
  ),
  // 🌾 Crop Management
  Quest(
    id: "crop_rotation_quest",
    name: "Crop Rotation Quest",
    description:
        "Improve soil health and break pest cycles by rotating different crops across seasons.",
    objectives: [
      Objective(
        description: "Select alternate crop for rotation",
        isCompleted: false,
      ),
      Objective(description: "Prepare soil accordingly", isCompleted: false),
      Objective(description: "Document planting", isCompleted: false),
    ],
    photo: "assets/images/croprotation.jpg",
    badge: "Rotation Master Badge",
    rewardPoints: 400,
    eligibility: "Farmers with at least two cropping seasons",
    redeemInstructions: "Use points to access crop advisory services.",
  ),
  Quest(
    id: "intercropping_trial",
    name: "Intercropping Trial",
    description:
        "Maximize land utilization and increase biodiversity by growing multiple crops together.",
    objectives: [
      Objective(
        description: "Plant two or more crops together",
        isCompleted: false,
      ),
      Objective(description: "Track yield differences", isCompleted: false),
    ],
    photo: "assets/images/intercropping.jpg",
    badge: "Diversity Champion Badge",
    rewardPoints: 350,
    eligibility: "Farmers with min. 1 acre available",
    redeemInstructions: "Redeem points for fertilizer discount coupons.",
  ),
  Quest(
    id: "pest_safe_practice",
    name: "Pest-Safe Practice",
    description:
        "Protect crops from pests while maintaining environmental safety using organic methods.",
    objectives: [
      Objective(
        description: "Replace chemical pesticide with bio-pesticide",
        isCompleted: false,
      ),
      Objective(description: "Upload treatment records", isCompleted: false),
    ],
    photo: "assets/images/pestsafe.jpg",
    badge: "Eco Defender Badge",
    rewardPoints: 400,
    eligibility: "Applicable during pest-prone crop stages",
    redeemInstructions: "Use points for pest-control equipment support.",
  ),
  // 🌍 Sustainability & Innovation
  Quest(
    id: "zero_waste_farming",
    name: "Zero-Waste Farming",
    description:
        "Convert farm waste into valuable resources and contribute to sustainable agriculture practices.",
    objectives: [
      Objective(description: "Collect farm residues", isCompleted: false),
      Objective(
        description: "Convert them into compost or mulch",
        isCompleted: false,
      ),
    ],
    photo: "assets/images/zerowaste.jpg",
    badge: "Green Farmer Badge",
    rewardPoints: 300,
    eligibility: "All farmers",
    redeemInstructions: "Points can be redeemed as tree saplings.",
  ),
  Quest(
    id: "climate_smart_farming",
    name: "Climate-Smart Farming",
    description:
        "Adapt farming practices based on weather patterns and climate data for better yields.",
    objectives: [
      Objective(
        description: "Check weather forecast before sowing/irrigation",
        isCompleted: false,
      ),
      Objective(
        description: "Adjust practices accordingly",
        isCompleted: false,
      ),
    ],
    photo: "assets/images/climatesmart.jpg",
    badge: "Smart Farmer Badge",
    rewardPoints: 450,
    eligibility: "Farmers with access to mobile weather data",
    redeemInstructions: "Redeem points for free weather alerts.",
  ),
  Quest(
    id: "carbon_footprint_tracker",
    name: "Carbon Footprint Tracker",
    description:
        "Monitor and reduce your farm's environmental impact by tracking resource usage.",
    objectives: [
      Objective(description: "Log fertilizer usage", isCompleted: false),
      Objective(description: "Log water and fuel usage", isCompleted: false),
      Objective(
        description: "Submit seasonal footprint report",
        isCompleted: false,
      ),
    ],
    photo: "assets/images/carbonfootprint.jpg",
    badge: "Sustainability Star Badge",
    rewardPoints: 500,
    eligibility: "Farmers with minimum 1 season of records",
    redeemInstructions: "Points add eligibility for green scheme subsidies.",
  ),
  // 📊 Learning & Knowledge
  Quest(
    id: "farm_logbook_quest",
    name: "Farm Logbook Quest",
    description:
        "Maintain detailed digital records of farming activities for better planning and analysis.",
    objectives: [
      Objective(
        description: "Digitally record sowing dates",
        isCompleted: false,
      ),
      Objective(description: "Track irrigation events", isCompleted: false),
      Objective(description: "Log harvest details", isCompleted: false),
    ],
    photo: "assets/images/farmlogbook.jpg",
    badge: "Data Farmer Badge",
    rewardPoints: 350,
    eligibility: "Smartphone-owning farmers",
    redeemInstructions: "Redeem points for free mobile data packs.",
  ),
  Quest(
    id: "agri_quiz_challenge",
    name: "Agri Quiz Challenge",
    description:
        "Test and expand your agricultural knowledge through interactive quizzes and learning modules.",
    objectives: [
      Objective(description: "Answer quiz on soil health", isCompleted: false),
      Objective(description: "Answer quiz on water use", isCompleted: false),
      Objective(
        description: "Answer quiz on sustainable practices",
        isCompleted: false,
      ),
    ],
    photo: "assets/images/agriquiz.jpg",
    badge: "Knowledge Grower Badge",
    rewardPoints: 200,
    eligibility: "All registered farmers",
    redeemInstructions: "Points unlock advanced training modules.",
  ),
];
