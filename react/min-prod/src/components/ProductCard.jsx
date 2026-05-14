function ProductCard({ title, price, category }) {
  return (
    <article className="product-card">
      <h3>{title}</h3>
      <p className="product-price">Цена: {price} тг</p>
      <p className="product-category">Категория: {category}</p>
      <button type="button" className="details-button">
        Подробнее
      </button>
    </article>
  );
}

export default ProductCard;
