# 1. Базовый образ NVIDIA PyTorch
FROM nvcr.io/nvidia/pytorch:25.05-py3

# 2. Установка рабочей директории в контейнере
WORKDIR /app

# 3. Копирование файла окружения
# Образы NVIDIA обычно имеют предустановленный conda.
COPY environment.yml environment.yml

# 4. Создание/обновление conda-окружения из файла environment.yml
# Мы создадим новое окружение, чтобы не конфликтовать с базовым окружением PyTorch,
# если в нем есть специфичные версии, или можем попытаться установить в существующее.
# Создание нового окружения 'titanic-env' чище.
# Базовые образы NVIDIA могут не иметь некоторых утилит, установленных по умолчанию в miniconda3,
# поэтому добавим bash и procps, если они понадобятся JupyterLab для терминалов и т.д.
RUN conda env create -f environment.yml && \
    conda run -n titanic-env conda install -y bash procps && \
    conda clean -afy

# 5. Копирование всего остального кода проекта в рабочую директорию /app
COPY . .

# 6. Делаем порт JupyterLab доступным
EXPOSE 8888

# 7. Команда для запуска JupyterLab при старте контейнера
# Используем conda run для активации нашего окружения titanic-env.
# Образы NVIDIA часто запускаются от root.
# Важно: убедитесь, что в conda run используется правильный shell, если возникают проблемы.
# Часто в этих образах уже есть нужные настройки для conda.
CMD ["conda", "run", "-n", "titanic-env", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]