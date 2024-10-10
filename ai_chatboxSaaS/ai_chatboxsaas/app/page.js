import Image from "next/image";
import styles from "./page.module.css";

export default function Home() {
  return (
    <div className={styles.page}>
      <main className={styles.main}>
    <div>
      <h1>Hi Wclome </h1>
      <p>This app is for a AI-chatbox in Next.js</p>
    </div>
    </main>
      
    </div>
  );
}
