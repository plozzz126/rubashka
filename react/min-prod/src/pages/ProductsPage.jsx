import { useMemo, useState } from "react";
import ProductCard from "../components/ProductCard";
import products from "../data/products";

function ProductsPage() {
  const [search, setSearch] = useState("");

  const filteredProducts = useMemo(() => {
    const query = search.trim().toLowerCase();

    if (!query) {
      return products;
    }

    return products.filter((product) =>
      product.title.toLowerCase().includes(query)
    );
  }, [search]);

  return (
    <section className="products-page">
      <div className="products-head">
        <h2>Товары</h2>
        <span className="count-badge">Найдено: {filteredProducts.length}</span>
      </div>

      <p className="section-text">Введите название товара, чтобы быстро отфильтровать список.</p>

      <label htmlFor="search" className="search-label">
        Поиск по названию
      </label>
      <input
        id="search"
        type="text"
        placeholder="Например: Samsung"
        value={search}
        onChange={(event) => setSearch(event.target.value)}
        className="search-input"
      />

      {filteredProducts.length === 0 ? (
        <p className="empty-text">По этому запросу ничего не найдено.</p>
      ) : (
        <div className="products-grid">
          {filteredProducts.map((product) => (
            <ProductCard
              key={product.id}
              title={product.title}
              price={product.price}
              category={product.category}
            />
          ))}
        </div>
      )}
    </section>
  );
}

export default ProductsPage;
