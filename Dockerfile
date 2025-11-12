FROM eclipse-temurin:17-jre

WORKDIR /app

# Скачиваем сервер 1.12.2
RUN wget -O server.jar https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar

# Принимаем EULA
RUN echo "eula=true" > eula.txt

# Предварительная генерация мира (опционально)
# RUN java -Xmx256M -jar server.jar nogui && sleep 30 && echo "stop" >> logs.txt

# Копируем оптимизированные настройки
COPY server.properties ./

EXPOSE 25565

# Запуск с минимальной памятью
CMD ["java", "-Xmx256M", "-Xms128M", "-jar", "server.jar", "nogui"]
