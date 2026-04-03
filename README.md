# server-docker-compose

## Purpose
- WTR MAX에 self-hosting 중인 서비스들의 compose 및 설정 기록

## Self-Hosting List
- Dockge
- NPM+
- Stirling-PDF
- PostgreSQL
- IT-Tools
- Homepage
- CloudBeaver
- Authentik


## Convention


### docker-compose.yaml
#### Environment
KEY: VALUE 형식으로 작성한다.
```yaml
environment:
    # --- YES ---
    KEY1: VALUE1
    KEY2: VALUE2
    KEY3: ${ENVIRONMENT_VARIABLE}
    # --- NO ---
    - KEY1=VALUE1
    - KEY2=VALUE2
```
- *ENVIRONMENT_VARIABLE*과 같은 상수 또는 `.env` 파일에서 불러오는 변수는 UpperCase로 작성한다.

#### Volume & Network
List 형식으로 작성한다
```yaml
network:
    - network_default
volumes:
    - ./volume/:/volume/
```

### Annotation
#### 구분선
구분선을 그릴 때는 앞 뒤로 `---`를 붙여준다.
```yaml
environment:
    # --- Base Configuration ---
    KEY: VALUE

    # --- OIDC Configuration ---
    KEY: VALUE
```

#### Key Option Explanation
Key에 대한 옵션 설명을 할 때는 위 아래로 `------------------------------`를 붙여준다. (- X 30)
```yaml
environment:
    # ------------------------------
    # LOGIN_METHOD Option
    # 1. all : ID/PW + OAUTH2
    # 2. normal : ID/PW only
    # 3. oauth2 : OAUTH2 only
    # ------------------------------
    LOGIN_METHOD: all
```


