FROM sglahn/platformio-core:5.0.1
COPY ./build.sh /build.sh
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/build.sh" ]