#!/bin/bash

echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo