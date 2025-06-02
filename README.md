# 🚢 Titanic Survival Prediction with PyTorch 🧠

Проект по предсказанию выживаемости пассажиров "Титаника" с использованием **PyTorch**. Демонстрирует полный цикл от анализа и предобработки данных до обучения нейронной сети и генерации файла для [Kaggle](https://www.kaggle.com/competitions/titanic).

[![Python](https://img.shields.io/badge/Python-3.9%2B-blue.svg)](https://www.python.org/)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.0%2B-orange.svg)](https://pytorch.org/)
[![Pandas](https://img.shields.io/badge/Pandas-2.0%2B-darkgreen.svg)](https://pandas.pydata.org/)
[![Scikit-learn](https://img.shields.io/badge/Scikit--learn-1.2%2B-blueviolet.svg)](https://scikit-learn.org/)
[![Kaggle Score (Val Accuracy)](https://img.shields.io/badge/Kaggle%20Score%20(Val%20Accuracy)-~83.2%25-brightgreen.svg)](https://www.kaggle.com/competitions/titanic)
<!-- Замените YOUR_REPO на ваш актуальный репозиторий -->
<!-- [![CI Build](https://img.shields.io/github/actions/workflow/status/Vasja1142/YOUR_REPO/python-app.yml?branch=main&label=CI%20Build)](https://github.com/Vasja1142/YOUR_REPO/actions) -->

---

## 🌟 Ключевые Особенности Проекта

*   **Глубокий Feature Engineering:**
    *   Извлечение и стандартизация **титулов** (`Mr.`, `Miss.`, `Mrs.`, `Master`, `Rare`) из имен.
    *   Анализ и обработка **номеров билетов** (извлечение префикса, серии, нормализация).
    *   Использование информации о **палубе** (извлеченной из номера каюты, `U` для неизвестных).
*   **Тщательная Предобработка Данных:**
    *   Заполнение пропущенных значений (`Возраст`, `Тариф`).
    *   Удаление строк с минимальным количеством пропусков (`Порт Посадки`, `Титул`).
    *   Преобразование категориальных признаков (`Пол`, `Титул`, `Палуба`) в числовой формат (включая One-Hot Encoding).
*   **Моделирование на PyTorch:**
    *   Реализация модели **логистической регрессии** с `BatchNorm1d` на входе.
    *   Использование `BCEWithLogitsLoss`, оптимизатора `RAdam` с L2-регуляризацией (`weight_decay`).
    *   Применение планировщика скорости обучения `ReduceLROnPlateau`.
*   **Обучение и Оценка:**
    *   Разделение данных на обучающую и валидационную выборки (`train_test_split` со стратификацией).
    *   Кастомный `Dataset` и `DataLoader` для PyTorch.
    *   Визуализация кривых обучения (потери и точность).
*   **Результат:**
    *   Достижение точности **~83.2%** на валидационной выборке.
    *   Генерация файла `submission_titanic_pytorch.csv` для Kaggle.

---

## 🏗️ Структура Кода (Основные Блоки в `titanic_pytorch.py`)

Скрипт проекта логически разделен на следующие этапы, как в исходном коде:

1.  **ИМПОРТЫ**
2.  **ЗАГРУЗКА И ПЕРВИЧНАЯ ОБРАБОТКА ДАННЫХ**
3.  **ИЗВЛЕЧЕНИЕ ДОПОЛНИТЕЛЬНЫХ ПРИЗНАКОВ**
4.  **ОБРАБОТКА ПРОПУЩЕННЫХ ЗНАЧЕНИЙ**
5.  **ОБРАБОТКА БИЛЕТОВ**
6.  **ПРЕОБРАЗОВАНИЕ ТИПОВ ДАННЫХ**
7.  **ПОДГОТОВКА ДАННЫХ ДЛЯ ОБУЧЕНИЯ** *(включает One-Hot Encoding, удаление столбцов, выравнивание и разделение на X/y)*
8.  **ПРЕОБРАЗОВАНИЕ В PYTORCH ТЕНЗОРЫ**
9.  **СОЗДАНИЕ DATASET И DATALOADER**
10. **ОПРЕДЕЛЕНИЕ МОДЕЛИ**
11. **НАСТРОЙКА ОБУЧЕНИЯ** (функция потерь, оптимизатор, планировщик)
12. **ЦИКЛ ОБУЧЕНИЯ** (включая фазы обучения и валидации)
13. **ВИЗУАЛИЗАЦИЯ РЕЗУЛЬТАТОВ** (графики потерь и точности)
14. **СОЗДАНИЕ SUBMISSION ФАЙЛА**

---

## 🚀 Начало Работы

### Требования

*   Python 3.9+
*   Основные библиотеки (см. `requirements.txt`)

### Установка и Запуск

1.  **Клонируйте репозиторий:**
    ```bash
    git clone https://github.com/Vasja1142/YOUR_REPO.git 
    cd YOUR_REPO
    ```
    *(Замените `YOUR_REPO` на имя вашего репозитория)*

2.  **Создайте виртуальное окружение и установите зависимости:**
    ```bash
    python -m venv venv
    # Windows: venv\Scripts\activate  |  macOS/Linux: source venv/bin/activate
    pip install -r requirements.txt
    ```
    **Содержимое `requirements.txt`:**
    ```txt
    pandas>=1.5
    numpy>=1.20
    scikit-learn>=1.2
    torch>=2.0
    matplotlib>=3.5
    ```

3.  **Данные:**
    *   Создайте папку `data` в корне проекта.
    *   Скачайте `train.csv` и `test.csv` с [Kaggle Titanic Competition](https://www.kaggle.com/competitions/titanic/data) и поместите их в `data/`.

4.  **Запустите скрипт:**
    (Если ваш скрипт называется `titanic_pytorch.py`)
    ```bash
    python titanic_pytorch.py
    ```

---

## 💡 Возможные Улучшения

*   **Масштабирование** числовых признаков (`StandardScaler`).
*   **Feature Engineering:** Размер семьи, `IsAlone`.
*   **Другие модели:** Эксперименты с более сложными нейронными сетями или классическими ML моделями.
*   **Кросс-валидация** для более робастной оценки.
*   **Автоматический подбор гиперпараметров**.

---

Автор: **Vasja1142**
GitHub: [https://github.com/Vasja1142](https://github.com/Vasja1142)