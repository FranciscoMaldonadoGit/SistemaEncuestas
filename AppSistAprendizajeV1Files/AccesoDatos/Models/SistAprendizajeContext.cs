using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace AccesoDatos.Models
{
    public partial class SistAprendizajeContext : DbContext
    {
        public SistAprendizajeContext()
        {
        }

        public SistAprendizajeContext(DbContextOptions<SistAprendizajeContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Catalogo> Catalogos { get; set; }
        public virtual DbSet<Cuestionario> Cuestionarios { get; set; }
        public virtual DbSet<Pregunta> Preguntas { get; set; }
        public virtual DbSet<Respuesta> Respuestas { get; set; }
        public virtual DbSet<Resultado> Resultados { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost; Database=SistAprendizaje; Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Catalogo>(entity =>
            {
                entity.HasKey(e => e.IdCatalogo)
                    .HasName("PK__Catalogo__FD0AC26CD5A0D1D5");

                entity.Property(e => e.ClaveCatalogo)
                    .IsRequired()
                    .HasMaxLength(10);

                entity.Property(e => e.NombreCatalogos)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.Valor)
                    .IsRequired()
                    .HasMaxLength(500);
            });

            modelBuilder.Entity<Cuestionario>(entity =>
            {
                entity.HasKey(e => e.IdCuestionario)
                    .HasName("PK__Test__0E8DC9BEEBCD61F5");

                entity.Property(e => e.FechaAlta).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.NombreCuestionario)
                    .IsRequired()
                    .HasMaxLength(500);
            });

            modelBuilder.Entity<Pregunta>(entity =>
            {
                entity.HasKey(e => e.IdPregunta)
                    .HasName("PK__Pregunta__754EC09E743F649A");

                entity.Property(e => e.FechaAlta).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.TextoPregunta)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.IdCuestionarioNavigation)
                    .WithMany(p => p.Pregunta)
                    .HasForeignKey(d => d.IdCuestionario)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Preguntas_Test");
            });

            modelBuilder.Entity<Respuesta>(entity =>
            {
                entity.HasKey(e => e.IdRespuesta)
                    .HasName("PK__Respuest__D34801987295CEE6");

                entity.Property(e => e.EsCorrecta).HasColumnName("esCorrecta");

                entity.Property(e => e.FechaAlta).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");

                entity.Property(e => e.TextoRespuesta)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.IdPrefijoCatalogoNavigation)
                    .WithMany(p => p.Respuesta)
                    .HasForeignKey(d => d.IdPrefijoCatalogo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Respuestas_Catalogos");

                entity.HasOne(d => d.IdPreguntaNavigation)
                    .WithMany(p => p.Respuesta)
                    .HasForeignKey(d => d.IdPregunta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Respuestas_Preguntas");
            });

            modelBuilder.Entity<Resultado>(entity =>
            {
                entity.HasKey(e => e.IdResultados)
                    .HasName("PK__Resultad__947EA5FE7E1CD3E1");

                entity.Property(e => e.FechaAlta).HasColumnType("datetime");

                entity.Property(e => e.FechaModificacion).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
