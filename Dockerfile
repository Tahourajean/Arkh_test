FROM python:3.7.9
ADD code_solution.py .
ADD verif.py .
ENV RUN_IN_DOCKER Yes
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ENTRYPOINT [ "python3", "./code_solution.py"]
