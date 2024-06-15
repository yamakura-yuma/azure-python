FROM mcr.microsoft.com/devcontainers/base:jammy
# FROM mcr.microsoft.com/devcontainers/base:jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=vscode

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y build-essential --no-install-recommends make \
    ca-certificates \
    git \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev

# Python installation
USER $USER
ARG HOME="/home/$USER"
ARG PYTHON_VERSION=3.11
# ARG PYTHON_VERSION=3.10

###
### [deplicated] use poetry
###
# ENV PYENV_ROOT="${HOME}/.pyenv"
# ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH"

# RUN echo "done 0" \
#     && curl https://pyenv.run | bash \
#     && echo "done 1" \
#     && pyenv install ${PYTHON_VERSION} \
#     && echo "done 2" \
#     && pyenv global ${PYTHON_VERSION} \
#     && echo "done 3" \
#     && curl -sSL https://install.python-poetry.org | python3 - \
#     && poetry config virtualenvs.in-project true

###
### use rye + uv
###
SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]
RUN curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash && \
    rye config --set-bool behavior.global-python=true && \
    rye config --set-bool behavior.use-uv=true

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

COPY ./.python-version ./pyproject.toml ./requirements* ./
RUN rye pin "$(cat .python-version)" && \
    rye sync

RUN chown -R vscode $RYE_HOME
