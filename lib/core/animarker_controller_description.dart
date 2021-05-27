import 'package:flutter/material.dart';
import 'package:flutter_animarker/widgets/animarker.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

typedef RippleListener = void Function(Circle circle);
typedef MarkerListener = void Function(Marker marker, bool isStopover);
typedef OnStopover = Future<void> Function(LatLng latLng);

class AnimarkerControllerDescription {
  final RippleListener? onRippleAnimation;
  final MarkerListener? onMarkerAnimation;
  final OnStopover? onStopover;
  final TickerProvider vsync;
  final bool useRotation;
  final double angleThreshold;
  final int runExpressAfter;
  final bool isActiveTrip;
  final Color rippleColor;
  final double rippleRadius;
  final Curve curve;
  final Duration duration;
  final Duration rippleDuration;
  final Duration rippleIdleAfter;

  const AnimarkerControllerDescription({
    required this.vsync,
    this.useRotation = true,
    this.onStopover,
    this.onMarkerAnimation,
    this.angleThreshold = 1.5,
    this.isActiveTrip = true,
    this.runExpressAfter = 10,
    this.rippleRadius = 0.5,
    this.onRippleAnimation,
    this.curve = Curves.linear,
    this.rippleColor = Colors.red,
    this.duration = const Duration(milliseconds: 2500),
    this.rippleDuration = const Duration(milliseconds: 2000),
    this.rippleIdleAfter = const Duration(seconds: 30),
  });

  AnimarkerControllerDescription copyWith({
    final RippleListener? onRippleAnimation,
    final MarkerListener? onMarkerAnimation,
    final OnStopover? onStopover,
    final TickerProvider? vsync,
    final bool? useRotation,
    final double? angleThreshold,
    final int? runExpressAfter,
    final bool? isActiveTrip,
    final Color? rippleColor,
    final double? rippleRadius,
    final Curve? curve,
    final Duration? duration,
    final Duration? rippleDuration,
    final Duration? rippleIdleAfter,
  }) =>
      AnimarkerControllerDescription(
        onRippleAnimation: onRippleAnimation ?? this.onRippleAnimation,
        onMarkerAnimation: onMarkerAnimation ?? this.onMarkerAnimation,
        onStopover: onStopover ?? this.onStopover,
        vsync: vsync ?? this.vsync,
        useRotation: useRotation ?? this.useRotation,
        angleThreshold: angleThreshold ?? this.angleThreshold,
        runExpressAfter: runExpressAfter ?? this.runExpressAfter,
        isActiveTrip: isActiveTrip ?? this.isActiveTrip,
        rippleColor: rippleColor ?? this.rippleColor,
        rippleRadius: rippleRadius ?? this.rippleRadius,
        curve: curve ?? this.curve,
        duration: duration ?? this.duration,
        rippleDuration: rippleDuration ?? this.rippleDuration,
        rippleIdleAfter: rippleIdleAfter ?? this.rippleIdleAfter,
      );

  factory AnimarkerControllerDescription.animarker(
    Animarker animarker, {
    required TickerProvider vsync,
    OnStopover? onStopover,
    RippleListener? onRippleAnimation,
    MarkerListener? onMarkerAnimation,
  }) =>
      AnimarkerControllerDescription(
        angleThreshold: animarker.angleThreshold,
        curve: animarker.curve,
        duration: animarker.duration,
        isActiveTrip: animarker.isActiveTrip,
        onMarkerAnimation: onMarkerAnimation,
        onRippleAnimation: onRippleAnimation,
        onStopover: onStopover,
        rippleIdleAfter: animarker.rippleIdleAfter,
        rippleColor: animarker.rippleColor,
        rippleDuration: animarker.rippleDuration,
        rippleRadius: animarker.rippleRadius,
        runExpressAfter: animarker.runExpressAfter,
        useRotation: animarker.useRotation,
        vsync: vsync,
      );
}
