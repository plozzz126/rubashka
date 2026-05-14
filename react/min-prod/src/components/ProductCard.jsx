function ProductCard({ title, price, category }) {
  const formattedPrice = new Intl.NumberFormat("ru-RU").format(price);

  return (
    <article className="product-card">
      <span className="category-pill">{category}</span>
      <h3>{title}</h3>
      <p className="product-price">{formattedPrice} тг</p>
      <button type="button" className="details-button">
        Подробнее
      </button>
    </article>
  );
}

export default ProductCard;
