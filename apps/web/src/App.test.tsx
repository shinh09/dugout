import { render, screen } from '@testing-library/react'
import { createMemoryRouter, RouterProvider } from 'react-router'
import { describe, expect, it } from 'vitest'
import { routes } from './router.tsx'

describe('App 레이아웃', () => {
  it('헤더 로고와 하단 비공식 고지 문구를 보여준다', () => {
    render(<RouterProvider router={createMemoryRouter(routes)} />)

    expect(screen.getByRole('link', { name: '덕아웃' })).toBeInTheDocument()
    expect(screen.getByText('덕아웃은 KBO 및 각 구단과 무관한 팬 서비스입니다')).toBeInTheDocument()
  })
})
