FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN git clone https://github.com/VIP-SAKIL/Ay2 Ay2
RUN cd Ay2 && pip3 install -U -r requirements.txt
CMD cd Ay2 && python3 -m YukkiMusic
