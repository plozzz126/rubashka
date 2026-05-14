import { NavLink } from "react-router-dom";

function Header() {
  return (
    <header className="site-header">
      <div className="container header-row">
        <h1 className="logo">Mini Products App</h1>
        <nav className="nav-links">
          <NavLink to="/" className={({ isActive }) => (isActive ? "active" : "")}>Главная</NavLink>
          <NavLink to="/products" className={({ isActive }) => (isActive ? "active" : "")}>Товары</NavLink>
          <NavLink to="/about" className={({ isActive }) => (isActive ? "active" : "")}>О проекте</NavLink>
        </nav>
      </div>
    </header>
  );
}

export default Header;
