FROM python:3.8
RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip install psutil
RUN pip install prometheus_client
ADD pod.py .
CMD [ "python3", "./pod.py" ]
