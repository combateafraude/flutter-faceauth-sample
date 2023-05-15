# CAF Flutter FaceAuth Sample

## Guia de configuração

- Preencha o arquivo `.gradle.env` com os valores fornecidos pela CAF
- Preencha o linha `pod 'CSLivenessSDK', :git => 'VALOR_FORNECIDO_PELA_CAF', :tag => 'VALOR_FORNECIDO_PELA_CAF'` do arquivo `ios/Podfile` com os valores fornecidos pela CAF
- Preencha as credenciais no arquivo `lib/dart.main` com os valores fornecidos pela CAF
- Execute os comandos `flutter clean` e `flutter pub get` para atualizar as dependencias
- Configure o `Application Id` e `Bundle Id` para os valores fornecidas à CAF no momento da criação das credencias.
- Para iOS talvez seja necessário rodar os o comando `pod install` na pasta `ios`