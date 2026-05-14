import { NavLink } from "react-router-dom";

function Header() {
  return (
    <header className="site-header">
      <div className="container header-row">
        <div className="brand-block">
          <p className="brand-kicker">React Mini Practice</p>
          <h1 className="logo">krut-prod</h1>
        </div>

        <nav className="nav-links" aria-label="Основная навигация">
          <NavLink to="/" className={({ isActive }) => (isActive ? "active" : "")}>Главная</NavLink>
          <NavLink to="/products" className={({ isActive }) => (isActive ? "active" : "")}>Товары</NavLink>
          <NavLink to="/about" className={({ isActive }) => (isActive ? "active" : "")}>О проекте</NavLink>
        </nav>
      </div>
    </header>
  );
}

export default Header;
