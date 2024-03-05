class TravelModel {
  String travelName;
  String image;
  String description;

  TravelModel({
    required this.travelName,
    required this.image,
    required this.description,
  });
}

List<TravelModel> travels = [
  TravelModel(
    travelName: 'Travel Korea',
    image:'assets/images/img_korea_travel.jpg',
    description: "Explore the dynamic blend of tradition and modernity in South Korea! Immerse yourself in the vibrant streets of Seoul, where towering skyscrapers coexist harmoniously with ancient palaces and bustling markets. Discover the rich cultural heritage at Gyeongbokgung Palace and the traditional Bukchon Hanok Village. Indulge your taste buds with delicious Korean cuisine, from sizzling BBQ to spicy kimchi. Experience the natural beauty of Jeju Island's volcanic landscapes and pristine beaches. From shopping districts like Myeongdong to serene temples like Jogyesa, South Korea offers an unforgettable journey for every traveler.",
  ),
  TravelModel(
    travelName: 'Travel Japan',
    image:'assets/images/img_japan_travel.jpg',
    description: "Embark on a journey to Japan, a land of ancient traditions and cutting-edge technology. Wander through the historic streets of Kyoto, where majestic temples and tranquil gardens await at every turn. Marvel at the iconic cherry blossoms in bloom during springtime in Tokyo's Ueno Park or Kyoto's Philosopher's Path. Dive into Japanese culture with a visit to a traditional tea ceremony or a sumo wrestling match. Indulge in the exquisite flavors of sushi, ramen, and tempura. Experience the futuristic vibe of Tokyo's Shibuya Crossing and Osaka's vibrant Dotonbori district. Whether you're seeking serenity in a Zen garden or excitement in a bustling metropolis, Japan offers a captivating experience for all.",
  ),
  TravelModel(
    travelName: 'Travel China',
    image:'assets/images/img_china_travel.jpg',
    description: "Delve into the timeless wonders of China, a nation steeped in history and brimming with cultural treasures. Stand in awe of the Great Wall winding through misty mountains and ancient cities like Beijing and Xi'an. Explore the imperial grandeur of the Forbidden City and the majestic Terracotta Army. Lose yourself in the bustling markets of Shanghai's Yu Garden or the tranquil landscapes of Guilin's karst mountains. Sample the diverse flavors of Chinese cuisine, from savory Peking duck to spicy Sichuan hot pot. Witness the modern marvels of Shanghai's skyline and the traditional charm of Suzhou's classical gardens. China's vast landscapes and rich heritage promise an unforgettable adventure for every traveler.",
  ),
];
