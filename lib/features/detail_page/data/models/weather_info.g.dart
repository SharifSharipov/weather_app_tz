// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherInfoAdapter extends TypeAdapter<WeatherInfo> {
  @override
  final int typeId = 0;

  @override
  WeatherInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherInfo(
      cityName: fields[0] as String,
      temperature: fields[1] as double,
      weatherCondition: fields[2] as String,
      date: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.temperature)
      ..writeByte(2)
      ..write(obj.weatherCondition)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
