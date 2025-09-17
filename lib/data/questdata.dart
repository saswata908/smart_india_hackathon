import "package:farmify_app/model/objective.dart";
import "package:farmify_app/model/questmodel.dart";

final List<Quest> quests = [
  // 🌱 Soil Health & Fertility
  Quest(
    name: "Soil Testing Quest",
    objectives: [
      Objective(description: "Collect a soil sample"),
      Objective(description: "Send it to a local lab"),
      Objective(description: "Upload results in the app"),
    ],
    photo: "assets/images/soiltest.png",
    badge: "Soil Health Badge",
    rewardPoints: 300,
    eligibility: "Available to all farmers with active crops",
    redeemInstructions: "Points can be redeemed for discounts on soil kits.",
    progress: 45,
  ),
  Quest(
    name: "Organic Fertilizer Use",
    objectives: [
      Objective(description: "Prepare compost or bio-fertilizer"),
      Objective(description: "Apply to one crop cycle"),
      Objective(description: "Upload before/after photos"),
    ],
    photo: "assets/images/organicfertiliser.png",
    badge: "Fertility Builder Badge",
    rewardPoints: 400,
    eligibility: "Farm size above 0.5 acre",
    redeemInstructions: "Use points at partner agri-input shops.",
    progress: 62,
  ),
  Quest(
    name: "Soil Cover Quest",
    objectives: [
      Objective(description: "Plant cover crops (e.g., legumes)"),
      Objective(description: "Apply mulch to reduce soil erosion"),
    ],
    photo: "assets/images/soilcover.jpg",
    badge: "Soil Protector Badge",
    rewardPoints: 350,
    eligibility: "Cereal crop farmers preferred",
    redeemInstructions: "Redeem points for seed vouchers.",
    progress: 28,
  ),

  // 💧 Water & Irrigation
  Quest(
    name: "Water Conservation Challenge",
    objectives: [
      Objective(description: "Implement drip or sprinkler irrigation"),
      Objective(description: "Record water usage before & after"),
    ],
    photo: "assets/images/waterconservation.jpg",
    badge: "Water Saver Badge",
    rewardPoints: 500,
    eligibility: "Farmers with irrigated land",
    redeemInstructions:
        "Points can reduce electricity bill through scheme tie-ups.",
    progress: 75,
  ),
  Quest(
    name: "Rainwater Harvesting",
    objectives: [
      Objective(description: "Set up rainwater harvesting structure"),
      Objective(description: "Show stored water used for irrigation"),
    ],
    photo: "assets/images/rainwater.jpg",
    badge: "Water Guardian Badge",
    rewardPoints: 450,
    eligibility: "Farmers with roof or open field collection area",
    redeemInstructions: "Redeem points for farm pond subsidy applications.",
    progress: 53,
  ),

  // 🌾 Crop Management
  Quest(
    name: "Crop Rotation Quest",
    objectives: [
      Objective(description: "Select alternate crop for rotation"),
      Objective(description: "Prepare soil accordingly"),
      Objective(description: "Document planting"),
    ],
    photo: "assets/images/croprotation.jpg",
    badge: "Rotation Master Badge",
    rewardPoints: 400,
    eligibility: "Farmers with at least two cropping seasons",
    redeemInstructions: "Use points to access crop advisory services.",
  ),
  Quest(
    name: "Intercropping Trial",
    objectives: [
      Objective(description: "Plant two or more crops together"),
      Objective(description: "Track yield differences"),
    ],
    photo: "assets/images/intercropping.jpg",
    badge: "Diversity Champion Badge",
    rewardPoints: 350,
    eligibility: "Farmers with min. 1 acre available",
    redeemInstructions: "Redeem points for fertilizer discount coupons.",
  ),
  Quest(
    name: "Pest-Safe Practice",
    objectives: [
      Objective(description: "Replace chemical pesticide with bio-pesticide"),
      Objective(description: "Upload treatment records"),
    ],
    photo: "assets/images/pestsafe.jpg",
    badge: "Eco Defender Badge",
    rewardPoints: 400,
    eligibility: "Applicable during pest-prone crop stages",
    redeemInstructions: "Use points for pest-control equipment support.",
  ),

  // 🌍 Sustainability & Innovation
  Quest(
    name: "Zero-Waste Farming",
    objectives: [
      Objective(description: "Collect farm residues"),
      Objective(description: "Convert them into compost or mulch"),
    ],
    photo: "assets/images/zerowaste.jpg",
    badge: "Green Farmer Badge",
    rewardPoints: 300,
    eligibility: "All farmers",
    redeemInstructions: "Points can be redeemed as tree saplings.",
  ),
  Quest(
    name: "Climate-Smart Farming",
    objectives: [
      Objective(description: "Check weather forecast before sowing/irrigation"),
      Objective(description: "Adjust practices accordingly"),
    ],
    photo: "assets/images/climatesmart.jpg",
    badge: "Smart Farmer Badge",
    rewardPoints: 450,
    eligibility: "Farmers with access to mobile weather data",
    redeemInstructions: "Redeem points for free weather alerts.",
  ),
  Quest(
    name: "Carbon Footprint Tracker",
    objectives: [
      Objective(description: "Log fertilizer usage"),
      Objective(description: "Log water and fuel usage"),
      Objective(description: "Submit seasonal footprint report"),
    ],
    photo: "assets/images/carbonfootprint.jpg",
    badge: "Sustainability Star Badge",
    rewardPoints: 500,
    eligibility: "Farmers with minimum 1 season of records",
    redeemInstructions: "Points add eligibility for green scheme subsidies.",
  ),

  // 📊 Learning & Knowledge
  Quest(
    name: "Farm Logbook Quest",
    objectives: [
      Objective(description: "Digitally record sowing dates"),
      Objective(description: "Track irrigation events"),
      Objective(description: "Log harvest details"),
    ],
    photo: "assets/images/farmlogbook.jpg",
    badge: "Data Farmer Badge",
    rewardPoints: 350,
    eligibility: "Smartphone-owning farmers",
    redeemInstructions: "Redeem points for free mobile data packs.",
  ),
  Quest(
    name: "Agri Quiz Challenge",
    objectives: [
      Objective(description: "Answer quiz on soil health"),
      Objective(description: "Answer quiz on water use"),
      Objective(description: "Answer quiz on sustainable practices"),
    ],
    photo: "assets/images/agriquiz.jpg",
    badge: "Knowledge Grower Badge",
    rewardPoints: 200,
    eligibility: "All registered farmers",
    redeemInstructions: "Points unlock advanced training modules.",
  ),
];
