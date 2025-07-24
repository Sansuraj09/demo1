FROM nginx:latest
COPY stu.html /usr/share/nginx/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
