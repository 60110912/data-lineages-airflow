FROM docker-local-dataplatform.art.lmru.tech/airflow:1.10.14-2

# Become root to install requirements
USER root

ADD requirements.txt requirements.txt

RUN pip install -r requirements.txt \
    && rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /usr/share/man \
        /usr/share/doc \
        /usr/share/doc-base \
        ~/.cache/pip

# Switch back to airflow user
USER airflow

# Set project name argument
# Example: PROJECT=mymod
ARG PROJECT=data_usage

ADD dags /usr/local/airflow/dags/${PROJECT}