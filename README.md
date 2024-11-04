lib/
├── main.dart               # 엔트리 포인트
├── core/                   # 공통적으로 사용되는 유틸리티, 상수, 테마, API 등
│   ├── api/                # API 서비스 클래스
│   ├── constants/          # 애플리케이션에서 사용하는 상수 (ex. URL, 에러 메시지)
│   ├── utils/              # 유틸리티 클래스 (ex. DateTime 포맷터, Validator)
│   └── theme/              # 테마 및 스타일 설정
├── data/                   # 데이터 레이어
│   ├── models/             # 모델 클래스
│   ├── repositories/       # 데이터 저장소 (ex. API, 로컬 저장소와 통신)
│   └── providers/          # 상태 관리 Provider (ex. ChangeNotifier, Bloc 등)
├── presentation/           # UI 레이어
│   ├── screens/            # 주요 화면
│   │   └── screen_name/    # 각 화면별 디렉터리
│   │       ├── screen_name_screen.dart
│   │       └── widgets/    # 화면에 필요한 하위 위젯들
│   ├── widgets/            # 공통적으로 사용하는 재사용 가능 위젯
│   └── styles/             # 스타일 파일 (ex. TextStyles, AppColors)
└── config/                 # 앱 설정
    ├── routes.dart         # 네비게이션 라우팅 설정
    └── environment.dart    # 환경별 설정 (ex. dev/prod 환경 구분)

core: 앱 전역에서 사용하는 상수, 테마, 유틸리티 함수 등을 포함하여 코드를 재사용할 수 있도록 분리합니다.

api: API 요청과 관련된 클래스를 관리합니다.
constants: 앱 전반에서 사용할 상수들을 정의합니다.
utils: 다양한 유틸리티 함수들을 포함하여 코드 중복을 줄이고 가독성을 높입니다.
theme: 앱의 색상 및 스타일 테마를 정의합니다.
data: 데이터와 관련된 레이어입니다.

models: API 응답이나 데이터베이스 객체를 정의하는 모델 클래스들이 위치합니다.
repositories: 데이터를 제공하는 역할을 하며, API 또는 로컬 저장소와의 통신을 처리합니다.
providers: 상태 관리를 위한 Provider, ChangeNotifier, Bloc 등을 관리하는 곳입니다.
presentation: UI와 관련된 레이어입니다.

screens: 앱의 주요 화면을 구성하는 폴더로, 각 화면별로 디렉터리를 만들어 필요한 위젯과 로직을 포함합니다.
widgets: 공통적으로 재사용할 수 있는 UI 위젯들을 모아 둔 폴더입니다.
styles: 앱의 텍스트 스타일, 색상 등을 정의하여 일관성 있는 UI를 제공합니다.
config: 앱의 설정과 환경을 관리합니다.

routes.dart: 앱의 라우팅을 관리하여 각 화면 간의 네비게이션을 처리합니다.
environment.dart: 개발과 배포 환경 설정을 관리합니다.