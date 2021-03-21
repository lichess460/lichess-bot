FROM debian:10.8-slim
MAINTAINER SAVIO PRINCE
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .
RUN apt-get update
RUN apt-get -y install sudo
RUN useradd OIVAS7572 && echo "OIVAS7572:OIVAS7572" | chpasswd && adduser OIVAS7572 sudo
USER OIVAS7572
#ADD /engine/ .

# If you are using docker  
# change config.yml engine and book to "./name"             
# 3-4-5piecesSyzygy.zip # 1Zd9uLYAK61eC_Yin79X59w1BfREfairU # 1qlxeEPpK72f_fplPqmhUk02Gxh8CEwNm
# Cerebellum3Merge.bin.7z # 1_f6Ru0FhD3V4-VFSUVuX6-95NLaL_Y3_ # Aaricia_2012.7z # 1FkYpoSGMh9Yh5VV3QK9y95l7z8rERO7E 
# http://abrok.eu/stockfish/latest/linux/stockfish_x64_modern.zip -O StockfishDev.zip

RUN echo OIVAS7572 | sudo -S rm -r engine
RUN echo OIVAS7572 | sudo -S apt-get update && sudo apt-get install -y vim
RUN echo OIVAS7572 | sudo -S apt-get install -y wget
RUN echo OIVAS7572 | sudo -S apt install p7zip-full -y

RUN echo OIVAS7572 | sudo -S wget https://abrok.eu/stockfish/builds/50890616591443ab06faa0927747bf14c8d450e3/linux64modern/stockfish_21031800_x64_modern.zip -O StockfishDev.zip 
RUN echo OIVAS7572 | sudo -S wget https://tests.stockfishchess.org/api/nn/nn-62ef826d1a6d.nnue -O nn-62ef826d1a6d.nnue
RUN echo OIVAS7572 | sudo -S 7z e StockfishDev.zip
RUN echo OIVAS7572 | sudo -S rm StockfishDev.zip
RUN echo OIVAS7572 | sudo -S mv stockfish_21031800_x64_modern StockfishDev


RUN echo OIVAS7572 | sudo -S wget --no-check-certificate "https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21281&authkey=ANYJmR2IBCnKjZg" -O 3-4-5piecesSyzygy.zip
RUN echo OIVAS7572 | sudo -S 7z e 3-4-5piecesSyzygy.zip
RUN echo OIVAS7572 | sudo -S rm 3-4-5piecesSyzygy.zip

RUN echo OIVAS7572 | sudo -S wget --no-check-certificate "https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21326&authkey=AGWhBN9O0T934Qk" -O Cerebellum3Merge.bin.7z
RUN echo OIVAS7572 | sudo -S 7z e Cerebellum3Merge.bin.7z
RUN echo OIVAS7572 | sudo -S rm Cerebellum3Merge.bin.7z 

#RUN echo OIVAS7572 | sudo -S wget --no-check-certificate "https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21313&authkey=AOcSjDjqXG9hjl4" -O Aaricia_2012.7z
#RUN echo OIVAS7572 | sudo -S 7z e Aaricia_2012.7z
#RUN echo OIVAS7572 | sudo -S rm Aaricia_2012.7z 

RUN echo OIVAS7572 | sudo -S apt-get install -y python3 python3-pip
RUN echo OIVAS7572 | sudo -S apt install python3-pip -y
COPY requirements.txt .
RUN echo OIVAS7572 | sudo -S python3 -m pip install --no-cache-dir -r requirements.txt
RUN echo OIVAS7572 | sudo -S chmod 777 ./
CMD python3 run.py

# Do note that everything from this line on, doesn't need to be added to your Dockerfile.
# Syzygy tablebases are stored here 
# https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21281&authkey=ANYJmR2IBCnKjZg
# Opening books used are Cerebellum and Aaricia 2012. These are stored here
# Cerebellum: https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21326&authkey=AGWhBN9O0T934Qk
# Aaricia 2012: https://onedrive.live.com/download?cid=2D02CAF4846BF413&resid=2D02CAF4846BF413%21313&authkey=AOcSjDjqXG9hjl4
# Remove the hash (#) before lines 38, 39 and 40 to use Aaricia 2012.
# You can even reome the hash (#) before lines 10 - 16.
# Engine used is Stockfish Modern (POPCNT+SSE2). Directly taken from the latest updates in https://abrok.eu/stockfish/
# Do note that simply adding this Dockerfile will not work, you'll have to make the required changes in other files.
# Also make sure not to use files which take up too much storage as heroku wouldn't support it.