
class ProductModel {
  String? sId;
  String? model;
  String? brand;
  String? details;
  String? category;
  String? img1;
  String? img2;
  String? status;
  double? price; // Change to double
  int? productId;
  double? avgRatings; // Change to double
  List<String>? reviews;
  String? sensorResolution;
  String? weight;
  String? keys;
  int? iV;
  String? createdAt;
  String? updatedAt;
  String? dimension;
  String? speed;
  String? airFlow;
  String? socket;
  String? systemRequirements;
  String? hotKeys;
  String? inputSensitivity;
  String? frequencyResponse;
  String? type;
  String? fan;
  String? capacity;
  String? voltage;
  String? frequency;
  String? latency;
  String? interface;
  String? sequential;
  String? input;
  String? output;
  String? power;
  String? backupTime;
  String? displaySize;
  String? displayType;
  String? resolution;
  String? refreshRate;
  String? responseTime;
  String? clockSpeed;
  String? size;
  String? recommendedPSU;
  String? memoryClock;
  String? cores;
  String? threads;
  String? cache;
  String? memoryTypes;
  String? supportedCPU;
  String? supportedRAM;
  String? chipset;
  String? slots;
  String? maximumMemory;
  String? base;

  ProductModel(
      {this.sId,
      this.model,
      this.brand,
      this.details,
      this.category,
      this.img1,
      this.img2,
      this.status,
      this.price,
      this.productId,
      this.avgRatings,
      this.reviews,
      this.sensorResolution,
      this.weight,
      this.keys,
      this.iV,
      this.createdAt,
      this.updatedAt,
      this.dimension,
      this.speed,
      this.airFlow,
      this.socket,
      this.systemRequirements,
      this.hotKeys,
      this.inputSensitivity,
      this.frequencyResponse,
      this.type,
      this.fan,
      this.capacity,
      this.voltage,
      this.frequency,
      this.latency,
      this.interface,
      this.sequential,
      this.input,
      this.output,
      this.power,
      this.backupTime,
      this.displaySize,
      this.displayType,
      this.resolution,
      this.refreshRate,
      this.responseTime,
      this.clockSpeed,
      this.size,
      this.recommendedPSU,
      this.memoryClock,
      this.cores,
      this.threads,
      this.cache,
      this.memoryTypes,
      this.supportedCPU,
      this.supportedRAM,
      this.chipset,
      this.slots,
      this.maximumMemory,
      this.base});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    model = json['Model'];
    brand = json['Brand'];
    details = json['Details'];
    category = json['Category'];
    img1 = json['img1'];
    img2 = json['img2'];
    status = json['Status'];
    
    // Convert price to double safely
    if (json['Price'] is int) {
      price = (json['Price'] as int).toDouble();
    } else {
      price = (json['Price'] as double?);
    }

    productId = json['ProductId'];
    
    // Convert avgRatings to double safely
    if (json['AvgRatings'] is int) {
      avgRatings = (json['AvgRatings'] as int).toDouble();
    } else {
      avgRatings = (json['AvgRatings'] as double?);
    }

    reviews = (json['Reviews'] as List<dynamic>?)?.cast<String>();
    sensorResolution = json['SensorResolution'];
    weight = json['Weight'];
    keys = json['Keys'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    dimension = json['Dimension'];
    speed = json['Speed'];
    airFlow = json['AirFlow'];
    socket = json['Socket'];
    systemRequirements = json['SystemRequirements'];
    hotKeys = json['HotKeys'];
    inputSensitivity = json['InputSensitivity'];
    frequencyResponse = json['FrequencyResponse'];
    type = json['Type'];
    fan = json['Fan'];
    capacity = json['Capacity'];
    voltage = json['Voltage'];
    frequency = json['Frequency'];
    latency = json['Latency'];
    interface = json['Interface'];
    sequential = json['Sequential'];
    input = json['Input'];
    output = json['Output'];
    power = json['Power'];
    backupTime = json['BackupTime'];
    displaySize = json['DisplaySize'];
    displayType = json['DisplayType'];
    resolution = json['Resolution'];
    refreshRate = json['RefreshRate'];
    responseTime = json['ResponseTime'];
    clockSpeed = json['ClockSpeed'];
    size = json['Size'];
    recommendedPSU = json['RecommendedPSU'];
    memoryClock = json['MemoryClock'];
    cores = json['Cores'];
    threads = json['Threads'];
    cache = json['Cache'];
    memoryTypes = json['MemoryTypes'];
    supportedCPU = json['SupportedCPU'];
    supportedRAM = json['SupportedRAM'];
    chipset = json['Chipset'];
    slots = json['Slots'];
    maximumMemory = json['MaximumMemory'];
    base = json['Base'];
  }
}
