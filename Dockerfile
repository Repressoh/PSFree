FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="PSFree" \
      org.opencontainers.image.description="PSFree static website" \
      org.opencontainers.image.licenses="AGPL-3.0-or-later"

COPY docker/default.conf /etc/nginx/conf.d/default.conf
COPY *.html *.mjs *.bin *.cache COPYING LICENSE /usr/share/nginx/html/
COPY fonts/ /usr/share/nginx/html/fonts/
COPY module/ /usr/share/nginx/html/module/
COPY rop/ /usr/share/nginx/html/rop/
COPY kpatch/ /usr/share/nginx/html/kpatch/
COPY AIO_Fix_Temp/ /usr/share/nginx/html/AIO_Fix_Temp/

EXPOSE 80
