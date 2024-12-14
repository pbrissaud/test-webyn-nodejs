# Changelog

## [1.3.0](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.6...v1.3.0) (2024-12-14)


### Features

* **terraform:** Add cloud run service ([3ffff77](https://github.com/pbrissaud/test-webyn-nodejs/commit/3ffff77df55b822dc8c73cc36a5b867fdc865368))
* **terraform:** Add service account for Cloud Run Service ([d1d470d](https://github.com/pbrissaud/test-webyn-nodejs/commit/d1d470d1a4243982dcbee3c3bc05deaa822f8172))


### Bug Fixes

* App startup ([eb3dc3f](https://github.com/pbrissaud/test-webyn-nodejs/commit/eb3dc3f57ad41466f43b57cec7a37cc5941a8d9f))
* **terraform:** Allow unauthenticated access and change port ([ef4faea](https://github.com/pbrissaud/test-webyn-nodejs/commit/ef4faeafb2e33175c238a6adbfd4da16ac619d70))
* **terraform:** Disable deletion protection ([cf68492](https://github.com/pbrissaud/test-webyn-nodejs/commit/cf68492ae7e4b64d984fcdd1a4518be1487cfd87))
* **terraform:** Use ports instead of env for container port ([22c93bc](https://github.com/pbrissaud/test-webyn-nodejs/commit/22c93bca6444df0b8845444fc29d3d7b878df6f9))
* test launch two servers at the same time ([bf53905](https://github.com/pbrissaud/test-webyn-nodejs/commit/bf539055c8c25671141c9c5276d3a35b4a58095d))

## [1.2.6](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.5...v1.2.6) (2024-12-14)


### Bug Fixes

* **CI:** google project var name ([e79fbbc](https://github.com/pbrissaud/test-webyn-nodejs/commit/e79fbbce15576ec79584c1a9852bcc075d926e7a))

## [1.2.5](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.4...v1.2.5) (2024-12-14)


### Bug Fixes

* **CI:** Fix registry URL and use variable ([b9fed4b](https://github.com/pbrissaud/test-webyn-nodejs/commit/b9fed4b17008cfb38092351a2d7ed5d0cf7a13b0))

## [1.2.4](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.3...v1.2.4) (2024-12-14)


### Bug Fixes

* **CI:** disable buildx ([b4072d4](https://github.com/pbrissaud/test-webyn-nodejs/commit/b4072d45dc17121238bd3fc687b65d6b23cc8b1f))

## [1.2.3](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.2...v1.2.3) (2024-12-14)


### Bug Fixes

* **terraform:** set repository in attributes ([1fa632d](https://github.com/pbrissaud/test-webyn-nodejs/commit/1fa632dcedcef6e1f16015e2e349f4fcb7ed460f))

## [1.2.2](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.1...v1.2.2) (2024-12-14)


### Bug Fixes

* **CI:** Upgrade action to v2 ([d2d7d78](https://github.com/pbrissaud/test-webyn-nodejs/commit/d2d7d784b91f1b00d9c0b5b00940098b6f532bc6))

## [1.2.1](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.2.0...v1.2.1) (2024-12-14)


### Bug Fixes

* **CI:** Google AR Authentication ([4fb9a03](https://github.com/pbrissaud/test-webyn-nodejs/commit/4fb9a03e031c2e8568e49f9aeecd4296896cff31))

## [1.2.0](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.1.0...v1.2.0) (2024-12-14)


### Features

* **CI:** Build and push Docker image on new release ([#11](https://github.com/pbrissaud/test-webyn-nodejs/issues/11)) ([ce32f95](https://github.com/pbrissaud/test-webyn-nodejs/commit/ce32f95b32f648ca19ef4c06984457ae357e8fa5))


### Bug Fixes

* **CI:** set release type ([#9](https://github.com/pbrissaud/test-webyn-nodejs/issues/9)) ([29c3437](https://github.com/pbrissaud/test-webyn-nodejs/commit/29c3437f2752d24b9ebc201a2b81e96947a3f8dd))
* **terraform:** update attribute name ([b015375](https://github.com/pbrissaud/test-webyn-nodejs/commit/b01537572b6bd56d1784dfb07fc808ffb5ef1f05))

## [1.1.0](https://github.com/pbrissaud/test-webyn-nodejs/compare/v1.0.0...v1.1.0) (2024-12-14)


### Features

* add Docker and compose file for developpment and production purposes ([c4f2846](https://github.com/pbrissaud/test-webyn-nodejs/commit/c4f2846c7a58613ddd9113a81d33106a2227e98a))
* Add terraform files to init the Docker registry and Github Keyless Authentication ([e9068d0](https://github.com/pbrissaud/test-webyn-nodejs/commit/e9068d0267c0ea59328989c465cd771cec4be32f))
* add testing framework ([#1](https://github.com/pbrissaud/test-webyn-nodejs/issues/1)) ([099de35](https://github.com/pbrissaud/test-webyn-nodejs/commit/099de35f5c35f9fadd6b245fb390d17a3787c92f))


### Bug Fixes

* add attribute_condition ([fe9f86c](https://github.com/pbrissaud/test-webyn-nodejs/commit/fe9f86c6db0a5b84a674053c58be83b04fb66fea))
* add google-beta provider ([ccb3b48](https://github.com/pbrissaud/test-webyn-nodejs/commit/ccb3b488f14090200ff51f3700a6aa3e7e3091f0))
* attribute ([b32a36d](https://github.com/pbrissaud/test-webyn-nodejs/commit/b32a36d5551ebf14ec766e588beebd54de072edf))
* attribute name ([fe91239](https://github.com/pbrissaud/test-webyn-nodejs/commit/fe91239c2840bafffa8e74f2c7dc6afd902becab))
* gcp region ([7ef1408](https://github.com/pbrissaud/test-webyn-nodejs/commit/7ef1408e4f69e2c17ef352af6d2ee97b012a2d4a))
* github org ([fa668bb](https://github.com/pbrissaud/test-webyn-nodejs/commit/fa668bb4576525878a16f16c64e8ff9acfcd781b))
* google region ([1fa57ba](https://github.com/pbrissaud/test-webyn-nodejs/commit/1fa57bacb534c17975f9e6dd2ad53b196d8d2c45))
* sa_mapping ([778bcf1](https://github.com/pbrissaud/test-webyn-nodejs/commit/778bcf17b7851a1c86b823de5d955d367d946fa7))
* typo in README ([0650463](https://github.com/pbrissaud/test-webyn-nodejs/commit/06504636fbd319bbf938b08d27db4ba7cfe4674f))
* update GitHub service account attributes ([176051a](https://github.com/pbrissaud/test-webyn-nodejs/commit/176051a4a93e4f5f7f8047c76ca6e43809cf4478))
* update GITHUB_TOKEN to use RELEASE_PLEASE_TOKEN in releasing workflow ([#4](https://github.com/pbrissaud/test-webyn-nodejs/issues/4)) ([cf1ac43](https://github.com/pbrissaud/test-webyn-nodejs/commit/cf1ac4398169b87bfd6916b92e69bbb5fcbfcdca))
