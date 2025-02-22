c---------------------------------------------------------------------
c---------------------------------------------------------------------

      subroutine  adi(rho_i, us, vs, ws, qs, square, rhs,
     $                forcing, u, nx, nxmax, ny, nz)

      integer nx, nxmax, ny, nz
      double precision rho_i  (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 us     (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 vs     (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 ws     (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 qs     (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 square (  0:nxmax-1,0:ny-1,0:nz-1), 
     $                 rhs    (5,0:nxmax-1,0:ny-1,0:nz-1), 
     $                 forcing(5,0:nxmax-1,0:ny-1,0:nz-1), 
     $                 u      (5,0:nxmax-1,0:ny-1,0:nz-1)

c---------------------------------------------------------------------
c---------------------------------------------------------------------

      call mpi_pcontrol(1, "compute_rhs")
      call compute_rhs(rho_i, us, vs, ws, qs, square, rhs,
     $                 forcing, u, nx, nxmax, ny, nz)
      call mpi_pcontrol(-1, "compute_rhs")

      call mpi_pcontrol(1, "x_solve")
      call x_solve(rho_i, qs, square, u, rhs, nx, nxmax, ny, nz)
      call mpi_pcontrol(-1, "x_solve")

      call mpi_pcontrol(1, "y_solve")
      call y_solve(rho_i, qs, square, u, rhs, nx, nxmax, ny, nz)
      call mpi_pcontrol(-1, "y_solve")

      call mpi_pcontrol(1, "z_solve")
      call z_solve(rho_i, qs, square, u, rhs, nx, nxmax, ny, nz)
      call mpi_pcontrol(-1, "z_solve")

      call add(u, rhs, nx, nxmax, ny, nz)

      return
      end

