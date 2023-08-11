FROM nikolaik/python-nodejs:python3.9-nodejs20
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN git clone https://github.com/Chiranjibkoch/ramdirempo ramdirempo
RUN cd ramdirempo && pip3 install -U -r requirements.txt
CMD cd ramdirempo && python3 -m YukkiMusic
