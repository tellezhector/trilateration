// --------------------------------------------------------------------------------------------------------------------
// <copyright file="StopWatch.cs" company="NearBPO">
//   copyrighttext
// </copyright>
// <author>
// Hector Tellez
// </author>
// <summary>
//   The cronometro.
// </summary>
// --------------------------------------------------------------------------------------------------------------------

namespace Splitter
{
    using System;

    /// <summary>
    /// The cronometro.
    /// </summary>
    public class StopWatch
    {
        /// <summary>
        /// The _iniciado.
        /// </summary>
        private bool _iniciado;

        /// <summary>
        /// Initializes a new instance of the <see cref="StopWatch"/> class.
        /// </summary>
        public StopWatch()
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="StopWatch"/> class.
        /// </summary>
        /// <param name="start">
        /// The start.
        /// </param>
        public StopWatch(bool start)
        {
            if (start)
            {
                Empezar();
            }
        }

        /// <summary>
        /// Gets a value indicating whether Corriendo.
        /// </summary>
        public bool Corriendo { get; private set; }

        /// <summary>
        /// Gets Ticks.
        /// </summary>
        /// <exception cref="NotSupportedException">
        /// Si el cronómetro no se encuentra corriendo, se lanza una excepción.
        /// </exception>
        public long Ticks
        {
            get
            {
                long total;
                if (!_iniciado)
                {
                    throw new NotSupportedException("Este cronómetro nunca comenzó a correr.");
                }

                if (Corriendo)
                {
                    total = DateTime.Now.Ticks - Inicial.Ticks;
                }
                else
                {
                    total = Final.Ticks - Inicial.Ticks;
                }

                return total;
            }
        }

        /// <summary>
        /// Gets Minutos.
        /// </summary>
        public double Minutos
        {
            get
            {
                return Math.Round(Milisegundos / 60000, 2);
            }
        }

        /// <summary>
        /// Gets Segundos.
        /// </summary>
        public double Seconds
        {
            get
            {
                return Math.Round(Milisegundos / 1000, 2);
            }
        }

        /// <summary>
        /// Gets Milisegundos.
        /// </summary>
        public double Milisegundos
        {
            get
            {
                return (double)Ticks / 10000;
            }
        }

        /// <summary>
        /// Gets or sets Inicial.
        /// </summary>
        private DateTime Inicial { get; set; }

        /// <summary>
        /// Gets or sets Final.
        /// </summary>
        private DateTime Final { get; set; }

        /// <summary>
        /// The empezar.
        /// </summary>
        /// <exception cref="NotSupportedException">
        /// Si se intenta empezar un cronómetro que ya se encontraba corriendo, se lanza una excepción.
        /// </exception>
        public void Empezar()
        {
            if (Corriendo)
            {
                throw new NotSupportedException("Este cronómetro ya se encontraba corriendo.");
            }

            Inicial = DateTime.Now;

            _iniciado = true;
            Corriendo = true;
        }

        /// <summary>
        /// The detener.
        /// </summary>
        /// <exception cref="NotSupportedException">
        /// Si el cronómetro no se encontraba corriendo y se intenta detener, se lanza una excepción.
        /// </exception>
        public void Detener()
        {
            if (!Corriendo)
            {
                throw new NotSupportedException("Este cronómetro no había empezado a correr. No se puede detener un cronómetro que no esté corriendo.");
            }

            Final = DateTime.Now;

            Corriendo = false;
        }

        /// <summary>
        /// The reiniciar.
        /// </summary>
        public void Reiniciar()
        {
            lock (this)
            {
                Corriendo = false;
                _iniciado = false;

                Empezar();
            }
        }

        /// <summary>
        /// The continuar.
        /// </summary>
        public void Continuar()
        {
            Corriendo = true;
            Final = new DateTime();
        }
    }
}
