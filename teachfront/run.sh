#!/bin/bash
sed -i "s/localhost/$main_ip/" /teachfront/src/config/ApplicationConfig.js
cd /teachfront
npm run start
