import { Link, Outlet } from 'react-router'

export default function App() {
  return (
    <div className="layout">
      <header className="header">
        <Link to="/" className="logo">
          덕아웃
        </Link>
      </header>
      <main className="main">
        <Outlet />
      </main>
      <footer className="footer">덕아웃은 KBO 및 각 구단과 무관한 팬 서비스입니다</footer>
    </div>
  )
}
