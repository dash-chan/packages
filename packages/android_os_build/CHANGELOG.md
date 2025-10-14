## 0.5.0 - 2025-10-14
### Added
- add Android 16 QPR2 version code full
- add getBackportedFixStatus api in Android 16 QPR2

## 0.4.1 - 2025-10-14
### Changed
- bump example gradle version to 8.13
- bump compile sdk to 36

## 0.4.0+1 - 2025-06-19
### Changed
- remove exlude from jnigen.yaml due to jnigen next version change
- update build doc

## 0.4.0 - 2025-06-13
### Added
- add android 36 support
- add function: `getMajorSdkVersion`
- add function: `getMinorSdkVersion`
- add field: `sdkIntFull`

### Changed
- bump jni version
- change topic: ffi -> jni

### Fixed
- fix a typo: eclair\_0\_1

## 0.3.0+1 - 2025-04-18
### Changed
- bump jni & jnigen version

## 0.3.0 - 2025-01-17
### Added
- expose BuildVersion constructor

### Changed
- BREAKCHANGE Partition.name nullable
- BREAKCHANGE Partition.fingerprint nullable
- BREAKCHANGE when BUILD value nullable, set to default \['unknown'\]

### Removed
- remove unused plugin\_platform\_interface

## 0.2.1 - 2024-11-18
### Added
- add Build.getFingerprintedPartitions api

### Changed
- update documents
- update example app

### Removed
- remove unused Build.part api

## 0.2.0 - 2024-11-15
### Changed
- \[BREAKCHANGE\] rename AndroidBuildVersion to BuildVersion
- add android document to some dart classes

### Removed
- remove Build.version.sdk due to android deprecated

## 0.1.0 - 2024-11-15
### Added
- add Build.version.sdk property

### Changed
- \[BREAKCHANGE\] rename AndroidBuild to Build

## 0.0.4 - 2024-11-15
### Changed
- bump jni version to 0.12.0
- generate codes

## 0.0.3+1 - 2024-09-06
### Changed
- bump ffi & ffigen version to 0.11.0

## 0.0.3 - 2024-08-13
### Changed
- set android compileSdk to 34

## 0.0.2+1 - 2024-08-13
### Changed
- change repo & issue link

## 0.0.2 - 2024-08-13
### Changed
- update apis

## 0.0.1 - 2024-08-07
### Added
- initial plugin
