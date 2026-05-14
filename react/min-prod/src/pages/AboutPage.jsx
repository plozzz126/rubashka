function AboutPage() {
  return (
    <section className="about-page">
      <h2>О проекте</h2>
      <p>
        Этот проект сделан как учебная мини-практика по React. Основная цель
        показать работу с компонентами и состоянием на простом примере.
      </p>

      <div className="about-grid">
        <article className="about-card">
          <h3>Что использовано</h3>
          <p>React, useState, props, map и react-router-dom.</p>
        </article>

        <article className="about-card">
          <h3>Что можно добавить</h3>
          <p>Детальную страницу товара, корзину и API вместо локального массива.</p>
        </article>
      </div>
    </section>
  );
}

export default AboutPage;
