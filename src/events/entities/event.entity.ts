import { eventos } from '@prisma/client';

export class EventEntity implements eventos {
  id_evento: number;
  nome_evento: string;
  endereco_evento: string;
  descricao: string;
  status_evento: number;
  data_evento: Date;
  curtida: number;
  imagem_evento: string;
  id_usuario: number;
  id_categoria: number;
}
