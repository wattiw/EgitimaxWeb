import 'package:device_info_plus/device_info_plus.dart';
import 'package:egitimax/utils/helper/localeManager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class DeviceInfo {

  late DeviceInfoPlugin deviceInfoPlugin;
  late Map<String, dynamic> _deviceData;
  late ThemeData theme;
  late AppLocalizations lang;
  late LocaleManager localeManager;

  DeviceInfo(BuildContext context){
    deviceInfoPlugin = DeviceInfoPlugin();
    _deviceData = <String, dynamic>{};
    theme = Theme.of(context);
    lang = AppLocalizations.of(context)!;
    localeManager = Provider.of<LocaleManager>(context, listen: false);
  }

  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        deviceData = switch (defaultTargetPlatform) {
          TargetPlatform.android =>
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo),
          TargetPlatform.iOS =>
              _readIosDeviceInfo(await deviceInfoPlugin.iosInfo),
          TargetPlatform.linux =>
              _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo),
          TargetPlatform.windows =>
              _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo),
          TargetPlatform.macOS =>
              _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo),
          TargetPlatform.fuchsia => <String, dynamic>{
            lang.libUtilsWidgetDeviceInfo_error:lang.libUtilsWidgetDeviceInfo_fuchsiaPlatformIsNotSupported
          },
        };
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        lang.libUtilsWidgetDeviceInfo_error:lang.libUtilsWidgetDeviceInfo_failedToGetPlatformVersion
      };
    }

    _deviceData = deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
      ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'patchVersion': data.patchVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
      'userName': data.userName,
      'majorVersion': data.majorVersion,
      'minorVersion': data.minorVersion,
      'buildNumber': data.buildNumber,
      'platformId': data.platformId,
      'csdVersion': data.csdVersion,
      'servicePackMajor': data.servicePackMajor,
      'servicePackMinor': data.servicePackMinor,
      'suitMask': data.suitMask,
      'productType': data.productType,
      'reserved': data.reserved,
      'buildLab': data.buildLab,
      'buildLabEx': data.buildLabEx,
      'digitalProductId': data.digitalProductId,
      'displayVersion': data.displayVersion,
      'editionId': data.editionId,
      'installDate': data.installDate,
      'productId': data.productId,
      'productName': data.productName,
      'registeredOwner': data.registeredOwner,
      'releaseId': data.releaseId,
      'deviceId': data.deviceId,
    };
  }

  Future<Tuple2<Map<String, dynamic>, DeviceType>> getDeviceData() async {
    await initPlatformState();
    return Tuple2(_deviceData, _getTargetPlatform());
  }


  Widget getDeviceInfo()  {
    return _getDeviceInfoWithScreenHeightAndConstantFixer();
  }

  DeviceType getDeviceType()  {
    return _getTargetPlatform();
  }

  Widget _getDeviceInfoWithScreenHeightAndConstantFixer()  {
    return FutureBuilder<Tuple2<Map<String, dynamic>, DeviceType>>(
      future:getDeviceData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${lang.libUtilsWidgetDeviceInfo_error}: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final deviceData = snapshot.data!.item1;
          final deviceType = snapshot.data!.item2;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: deviceData.length,
            itemBuilder: (context, index) {
              final property = deviceData.keys.elementAt(index);
              final value = deviceData[property];

              IconData icon;
              switch (deviceType) {
                case DeviceType.web:
                  icon = Icons.language;
                  break;
                case DeviceType.android:
                  icon = Icons.android;
                  break;
                case DeviceType.ios:
                  icon = Icons.phone_iphone;
                  break;
                case DeviceType.linux:
                  icon = Icons.keyboard_command_key;
                  break;
                case DeviceType.windows:
                  icon = Icons.computer;
                  break;
                case DeviceType.macos:
                  icon = Icons.desktop_mac;
                  break;
                case DeviceType.fuchsia:
                  icon = Icons.phone_android;
                  break;
              }

              return ListTile(
                dense: true,
                title: Row(
                  children: [
                    Expanded(
                      child: Text(
                        property,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      value.toString(),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(icon),
                ),
              );
            },
          );
        }
        return Container();
      },
    );

  }

  Widget _getDeviceInfoWithLayoutBuilder()  {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: constraints.maxHeight,
          ),
          color: Colors.green,
          child:FutureBuilder<Tuple2<Map<String, dynamic>, DeviceType>>(
            future:getDeviceData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${lang.libUtilsWidgetDeviceInfo_error}: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                final deviceData = snapshot.data!.item1;
                final deviceType = snapshot.data!.item2;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: deviceData.length,
                  itemBuilder: (context, index) {
                    final property = deviceData.keys.elementAt(index);
                    final value = deviceData[property];

                    IconData icon;
                    switch (deviceType) {
                      case DeviceType.web:
                        icon = Icons.language;
                        break;
                      case DeviceType.android:
                        icon = Icons.android;
                        break;
                      case DeviceType.ios:
                        icon = Icons.phone_iphone;
                        break;
                      case DeviceType.linux:
                        icon = Icons.keyboard_command_key;
                        break;
                      case DeviceType.windows:
                        icon = Icons.computer;
                        break;
                      case DeviceType.macos:
                        icon = Icons.desktop_mac;
                        break;
                      case DeviceType.fuchsia:
                        icon = Icons.phone_android;
                        break;
                    }

                    return ListTile(
                      dense: true,
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              property,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            value.toString(),
                            maxLines: 10,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(icon),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        );
      },
    );

  }

  Widget _getDeviceInfoWithNeverScrollableScrollPhysics() {
    return Container(
      alignment: Alignment.topLeft,
      child: FutureBuilder<Tuple2<Map<String, dynamic>, DeviceType>>(
        future: getDeviceData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${lang.libUtilsWidgetDeviceInfo_error}: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final deviceData = snapshot.data!.item1;
            final deviceType = snapshot.data!.item2;

            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: deviceData.length,
              itemBuilder: (context, index) {
                final property = deviceData.keys.elementAt(index);
                final value = deviceData[property];

                IconData icon;
                switch (deviceType) {
                  case DeviceType.web:
                    icon = Icons.language;
                    break;
                  case DeviceType.android:
                    icon = Icons.android;
                    break;
                  case DeviceType.ios:
                    icon = Icons.phone_iphone;
                    break;
                  case DeviceType.linux:
                    icon = Icons.keyboard_command_key;
                    break;
                  case DeviceType.windows:
                    icon = Icons.computer;
                    break;
                  case DeviceType.macos:
                    icon = Icons.desktop_mac;
                    break;
                  case DeviceType.fuchsia:
                    icon = Icons.phone_android;
                    break;
                }

                return ListTile(
                  dense: true,
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          property,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        value.toString(),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(icon),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  String _getAppBarTitle() => kIsWeb
      ? 'Web Browser info'
      : switch (defaultTargetPlatform) {
    TargetPlatform.android => 'Android Device Info',
    TargetPlatform.iOS => 'iOS Device Info',
    TargetPlatform.linux => 'Linux Device Info',
    TargetPlatform.windows => 'Windows Device Info',
    TargetPlatform.macOS => 'MacOS Device Info',
    TargetPlatform.fuchsia => 'Fuchsia Device Info',
  };

  DeviceType _getTargetPlatform() => kIsWeb
      ? DeviceType.web
      : switch (defaultTargetPlatform) {
    TargetPlatform.android => DeviceType.android,
    TargetPlatform.iOS => DeviceType.ios,
    TargetPlatform.linux => DeviceType.linux,
    TargetPlatform.windows => DeviceType.windows,
    TargetPlatform.macOS => DeviceType.macos,
    TargetPlatform.fuchsia => DeviceType.fuchsia,
  };
}

enum DeviceType { web, android, ios, linux, windows, macos, fuchsia }
