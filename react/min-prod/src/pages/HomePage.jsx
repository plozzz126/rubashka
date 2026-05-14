import { Link } from "react-router-dom";

function HomePage() {
  return (
    <section className="hero">
      <p className="hero-eyebrow">Мини-практика по React</p>
      <h2>Простой каталог товаров в темном минимализме</h2>
      <p>
        В проекте есть компоненты, props, state, фильтрация и роуты.
        Страница товаров показывает карточки и поиск по названию.
      </p>

      <div className="hero-actions">
        <Link className="cta-link" to="/products">
          Открыть товары
        </Link>
        <Link className="ghost-link" to="/about">
          О проекте
        </Link>
      </div>

      <div className="feature-grid">
        <article className="feature-card">
          <h3>Компоненты</h3>
          <p>Карточка товара вынесена в отдельный компонент.</p>
        </article>
        <article className="feature-card">
          <h3>Фильтрация</h3>
          <p>Поиск работает через `useState` в реальном времени.</p>
        </article>
        <article className="feature-card">
          <h3>Навигация</h3>
          <p>Переходы между страницами идут через React Router.</p>
        </article>
      </div>
    </section>
  );
}

export default HomePage;
